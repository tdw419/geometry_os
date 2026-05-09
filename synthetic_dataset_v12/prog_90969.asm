; DESCRIPTION: Creates a red rectangular region at (307, 120) spanning 93 by 18 pixels.
; PLAN: r0=307(x), r1=120(y), r2=93(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 120
LDI r2, 93
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
