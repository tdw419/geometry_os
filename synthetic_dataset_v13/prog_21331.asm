; DESCRIPTION: Composite: Places a green 95x56 rectangle at position (304, 98) then Draws a blue line from (338, 73) to (218, 124).
; PLAN: r0=304(x), r1=98(y), r2=95(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x1), r6=73(y1), r7=218(x2), r8=124(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 98
LDI r2, 95
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 73
LDI r7, 218
LDI r8, 124
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
