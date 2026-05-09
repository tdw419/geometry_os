; DESCRIPTION: Creates a red rectangular region at (263, 146) spanning 59 by 70 pixels.
; PLAN: r0=263(x), r1=146(y), r2=59(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 146
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
