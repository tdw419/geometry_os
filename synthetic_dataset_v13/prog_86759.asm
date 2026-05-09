; DESCRIPTION: Composite: Places a yellow 46x67 rectangle at position (38, 109) then Places a cyan dot at position (453, 19).
; PLAN: r0=38(x), r1=109(y), r2=46(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=19(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 109
LDI r2, 46
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 19
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
