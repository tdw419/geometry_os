; DESCRIPTION: Creates a blue rectangular region at (74, 93) spanning 120 by 45 pixels.
; PLAN: r0=74(x), r1=93(y), r2=120(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 93
LDI r2, 120
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
