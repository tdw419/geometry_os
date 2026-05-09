; DESCRIPTION: Places a cyan line segment connecting (125, 27) to (206, 42).
; PLAN: r0=125(x1), r1=27(y1), r2=206(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 27
LDI r2, 206
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
