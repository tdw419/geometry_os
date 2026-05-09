; DESCRIPTION: Places a cyan line segment connecting (459, 42) to (434, 65).
; PLAN: r0=459(x1), r1=42(y1), r2=434(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 42
LDI r2, 434
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
