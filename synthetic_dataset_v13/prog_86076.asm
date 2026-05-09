; DESCRIPTION: Renders a white box of size 55x27 starting at (439, 16).
; PLAN: r0=439(x), r1=16(y), r2=55(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 16
LDI r2, 55
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
