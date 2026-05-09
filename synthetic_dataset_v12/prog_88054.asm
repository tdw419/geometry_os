; DESCRIPTION: Renders a green line between points (313, 113) and (386, 231).
; PLAN: r0=313(x1), r1=113(y1), r2=386(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 113
LDI r2, 386
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
