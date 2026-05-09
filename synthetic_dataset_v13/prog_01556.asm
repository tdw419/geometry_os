; DESCRIPTION: Renders a green box of size 102x42 starting at (263, 166).
; PLAN: r0=263(x), r1=166(y), r2=102(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 166
LDI r2, 102
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
