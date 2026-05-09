; DESCRIPTION: Places a cyan line segment connecting (482, 16) to (320, 113).
; PLAN: r0=482(x1), r1=16(y1), r2=320(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 16
LDI r2, 320
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
