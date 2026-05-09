; DESCRIPTION: Creates a blue rectangular region at (197, 93) spanning 40 by 16 pixels.
; PLAN: r0=197(x), r1=93(y), r2=40(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 93
LDI r2, 40
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
