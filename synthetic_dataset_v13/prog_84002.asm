; DESCRIPTION: Creates a yellow rectangular region at (294, 109) spanning 82 by 60 pixels.
; PLAN: r0=294(x), r1=109(y), r2=82(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 109
LDI r2, 82
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
