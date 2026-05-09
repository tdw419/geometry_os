; DESCRIPTION: Renders a cyan box of size 28x42 starting at (103, 177).
; PLAN: r0=103(x), r1=177(y), r2=28(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 177
LDI r2, 28
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
