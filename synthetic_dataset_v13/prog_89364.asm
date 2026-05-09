; DESCRIPTION: Renders a yellow box of size 27x93 starting at (143, 82).
; PLAN: r0=143(x), r1=82(y), r2=27(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 82
LDI r2, 27
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
