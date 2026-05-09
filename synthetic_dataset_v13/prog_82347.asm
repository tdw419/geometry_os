; DESCRIPTION: Draws a green line from (386, 255) to (234, 173).
; PLAN: r0=386(x1), r1=255(y1), r2=234(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 255
LDI r2, 234
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
