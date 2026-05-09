; DESCRIPTION: Creates a blue rectangular region at (96, 197) spanning 120 by 48 pixels.
; PLAN: r0=96(x), r1=197(y), r2=120(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 197
LDI r2, 120
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
