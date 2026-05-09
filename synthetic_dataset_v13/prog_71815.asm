; DESCRIPTION: Places a green line segment connecting (50, 251) to (404, 213).
; PLAN: r0=50(x1), r1=251(y1), r2=404(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 251
LDI r2, 404
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
