; DESCRIPTION: Creates a red rectangular region at (197, 82) spanning 93 by 55 pixels.
; PLAN: r0=197(x), r1=82(y), r2=93(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 82
LDI r2, 93
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
