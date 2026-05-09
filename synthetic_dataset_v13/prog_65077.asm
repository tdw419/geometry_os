; DESCRIPTION: Creates a magenta rectangular region at (44, 129) spanning 42 by 50 pixels.
; PLAN: r0=44(x), r1=129(y), r2=42(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 129
LDI r2, 42
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
