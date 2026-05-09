; DESCRIPTION: Places a green line segment connecting (154, 50) to (230, 213).
; PLAN: r0=154(x1), r1=50(y1), r2=230(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 50
LDI r2, 230
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
