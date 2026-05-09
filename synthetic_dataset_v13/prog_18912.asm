; DESCRIPTION: Composite: Places a orange 80x77 rectangle at position (420, 139) then Renders a orange line between points (454, 157) and (16, 50).
; PLAN: r0=420(x), r1=139(y), r2=80(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=157(y1), r7=16(x2), r8=50(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 139
LDI r2, 80
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 157
LDI r7, 16
LDI r8, 50
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
