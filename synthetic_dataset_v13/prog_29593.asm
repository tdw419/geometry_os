; DESCRIPTION: Renders a magenta box of size 53x46 starting at (439, 146).
; PLAN: r0=439(x), r1=146(y), r2=53(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 146
LDI r2, 53
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
