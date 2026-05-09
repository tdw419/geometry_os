; DESCRIPTION: Creates a blue rectangular region at (295, 93) spanning 13 by 120 pixels.
; PLAN: r0=295(x), r1=93(y), r2=13(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 93
LDI r2, 13
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
