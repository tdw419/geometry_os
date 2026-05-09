; DESCRIPTION: Places a white line segment connecting (173, 215) to (410, 59).
; PLAN: r0=173(x1), r1=215(y1), r2=410(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 215
LDI r2, 410
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
