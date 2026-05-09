; DESCRIPTION: Renders a cyan box of size 112x53 starting at (196, 42).
; PLAN: r0=196(x), r1=42(y), r2=112(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 42
LDI r2, 112
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
