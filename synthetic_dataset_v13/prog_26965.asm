; DESCRIPTION: Composite: Places a orange dot at position (96, 231) then Renders a white box of size 28x42 starting at (226, 126).
; PLAN: r0=96(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=126(y), r7=28(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 226
LDI r6, 126
LDI r7, 28
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
