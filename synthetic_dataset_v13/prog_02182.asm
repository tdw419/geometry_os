; DESCRIPTION: Renders a cyan box of size 116x33 starting at (326, 82).
; PLAN: r0=326(x), r1=82(y), r2=116(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 82
LDI r2, 116
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
