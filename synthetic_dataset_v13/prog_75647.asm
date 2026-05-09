; DESCRIPTION: Composite: Places a red circle of radius 68 at center (141, 77) then Draws a cyan line from (218, 122) to (277, 152).
; PLAN: r0=141(x), r1=77(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x1), r6=122(y1), r7=277(x2), r8=152(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 77
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 122
LDI r7, 277
LDI r8, 152
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
