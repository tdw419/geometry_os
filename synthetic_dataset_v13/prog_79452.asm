; DESCRIPTION: Draws a green line from (239, 72) to (128, 113).
; PLAN: r0=239(x1), r1=72(y1), r2=128(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 72
LDI r2, 128
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
