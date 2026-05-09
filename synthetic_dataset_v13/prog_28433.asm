; DESCRIPTION: Places a cyan line segment connecting (328, 144) to (305, 125).
; PLAN: r0=328(x1), r1=144(y1), r2=305(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 144
LDI r2, 305
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
