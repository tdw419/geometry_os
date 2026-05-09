; DESCRIPTION: Places a cyan line segment connecting (146, 146) to (395, 215).
; PLAN: r0=146(x1), r1=146(y1), r2=395(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 146
LDI r2, 395
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
