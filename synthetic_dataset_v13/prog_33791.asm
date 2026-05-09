; DESCRIPTION: Draws a cyan line from (488, 93) to (62, 224).
; PLAN: r0=488(x1), r1=93(y1), r2=62(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 93
LDI r2, 62
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
