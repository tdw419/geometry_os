; DESCRIPTION: Composite: Places a white 75x99 rectangle at position (206, 88) then Places a blue dot at position (403, 205).
; PLAN: r0=206(x), r1=88(y), r2=75(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=205(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 206
LDI r1, 88
LDI r2, 75
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 205
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
