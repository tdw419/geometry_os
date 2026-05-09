; DESCRIPTION: Composite: Places a purple 103x68 rectangle at position (258, 38) then Places a orange dot at position (454, 37).
; PLAN: r0=258(x), r1=38(y), r2=103(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=37(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 38
LDI r2, 103
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 37
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
