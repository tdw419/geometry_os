; DESCRIPTION: Creates a red rectangular region at (77, 173) spanning 64 by 59 pixels.
; PLAN: r0=77(x), r1=173(y), r2=64(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 173
LDI r2, 64
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
