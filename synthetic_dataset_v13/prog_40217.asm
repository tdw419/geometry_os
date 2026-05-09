; DESCRIPTION: Creates a magenta rectangular region at (294, 13) spanning 39 by 91 pixels.
; PLAN: r0=294(x), r1=13(y), r2=39(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 13
LDI r2, 39
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
