; DESCRIPTION: Composite: Places a green 56x86 rectangle at position (124, 57) then Places a green line segment connecting (319, 65) to (98, 194).
; PLAN: r0=124(x), r1=57(y), r2=56(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=65(y1), r7=98(x2), r8=194(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 57
LDI r2, 56
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 65
LDI r7, 98
LDI r8, 194
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
