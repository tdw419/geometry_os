; DESCRIPTION: Creates a white rectangular region at (197, 93) spanning 31 by 64 pixels.
; PLAN: r0=197(x), r1=93(y), r2=31(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 93
LDI r2, 31
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
