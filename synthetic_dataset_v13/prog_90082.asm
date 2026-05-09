; DESCRIPTION: Renders a red box of size 60x42 starting at (154, 108).
; PLAN: r0=154(x), r1=108(y), r2=60(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 108
LDI r2, 60
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
