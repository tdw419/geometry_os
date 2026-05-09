; DESCRIPTION: Renders a cyan box of size 103x81 starting at (185, 143).
; PLAN: r0=185(x), r1=143(y), r2=103(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 143
LDI r2, 103
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
