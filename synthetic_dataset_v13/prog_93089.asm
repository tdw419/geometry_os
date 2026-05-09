; DESCRIPTION: Composite: Places a red dot at position (305, 7) then Places a purple 71x91 rectangle at position (53, 86).
; PLAN: r0=305(x), r1=7(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=86(y), r7=71(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 7
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 86
LDI r7, 71
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
