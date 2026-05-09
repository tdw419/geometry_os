; DESCRIPTION: Composite: Places a yellow 96x86 rectangle at position (237, 27) then Places a red dot at position (64, 22).
; PLAN: r0=237(x), r1=27(y), r2=96(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=22(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 27
LDI r2, 96
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 22
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
