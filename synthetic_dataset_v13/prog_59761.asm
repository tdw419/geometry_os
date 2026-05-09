; DESCRIPTION: Creates a red rectangular region at (25, 190) spanning 67 by 59 pixels.
; PLAN: r0=25(x), r1=190(y), r2=67(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 190
LDI r2, 67
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
