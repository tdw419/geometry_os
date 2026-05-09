; DESCRIPTION: Renders a orange line between points (386, 84) and (510, 113).
; PLAN: r0=386(x1), r1=84(y1), r2=510(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 84
LDI r2, 510
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
