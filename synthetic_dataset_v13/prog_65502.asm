; DESCRIPTION: Places a cyan line segment connecting (188, 59) to (284, 108).
; PLAN: r0=188(x1), r1=59(y1), r2=284(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 59
LDI r2, 284
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
