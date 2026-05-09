; DESCRIPTION: Composite: Places a yellow 36x105 rectangle at position (393, 61) then Places a cyan line segment connecting (9, 13) to (422, 249).
; PLAN: r0=393(x), r1=61(y), r2=36(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=13(y1), r7=422(x2), r8=249(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 61
LDI r2, 36
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 13
LDI r7, 422
LDI r8, 249
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
