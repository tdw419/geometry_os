; DESCRIPTION: Renders a cyan box of size 56x75 starting at (133, 21).
; PLAN: r0=133(x), r1=21(y), r2=56(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 21
LDI r2, 56
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
