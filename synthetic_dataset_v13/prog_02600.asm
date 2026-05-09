; DESCRIPTION: Renders a green line between points (425, 244) and (398, 246).
; PLAN: r0=425(x1), r1=244(y1), r2=398(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 244
LDI r2, 398
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
