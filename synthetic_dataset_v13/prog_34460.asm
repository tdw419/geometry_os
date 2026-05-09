; DESCRIPTION: Renders a magenta box of size 56x42 starting at (304, 174).
; PLAN: r0=304(x), r1=174(y), r2=56(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 174
LDI r2, 56
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
