; DESCRIPTION: Places a cyan line segment connecting (146, 42) to (300, 120).
; PLAN: r0=146(x1), r1=42(y1), r2=300(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 42
LDI r2, 300
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
