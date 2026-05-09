; DESCRIPTION: Places a green line segment connecting (284, 166) to (269, 173).
; PLAN: r0=284(x1), r1=166(y1), r2=269(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 166
LDI r2, 269
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
