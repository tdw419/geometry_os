; DESCRIPTION: Creates a red rectangular region at (50, 10) spanning 91 by 82 pixels.
; PLAN: r0=50(x), r1=10(y), r2=91(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 10
LDI r2, 91
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
