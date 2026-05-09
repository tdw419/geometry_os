; DESCRIPTION: Draws a green line from (290, 239) to (67, 76).
; PLAN: r0=290(x1), r1=239(y1), r2=67(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 239
LDI r2, 67
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
