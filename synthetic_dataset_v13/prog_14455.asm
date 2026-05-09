; DESCRIPTION: Places a red line segment connecting (474, 124) to (398, 146).
; PLAN: r0=474(x1), r1=124(y1), r2=398(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 124
LDI r2, 398
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
