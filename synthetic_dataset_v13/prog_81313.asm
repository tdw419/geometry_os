; DESCRIPTION: Places a cyan 85x75 rectangle at position (369, 180).
; PLAN: r0=369(x), r1=180(y), r2=85(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 180
LDI r2, 85
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
