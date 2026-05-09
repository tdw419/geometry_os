; DESCRIPTION: Places a white line segment connecting (445, 206) to (171, 254).
; PLAN: r0=445(x1), r1=206(y1), r2=171(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 206
LDI r2, 171
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
