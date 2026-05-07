; mixed program
; initialization
  LDI r9, 1981
  LDI r10, 256
  LDI r31, 8
  LDI r13, 128
  LDI r8, 0x1F8D2F
  CMP r0, r1
  JZ r0, else_0
  MUL r1, r14, r15
  DIV r14, r6, r0
  SUB r5, r8, r15
  JMP endif_1
else_0:
  LDI r6, 4048
  LDI r6, 64
  LDI r4, 0xBC5D0F
  PSETI
  LDI r11, 279
  LDI r2, 1260
  LDI r10, 1676
  LDI r6, 0x448F9B
  LDI r2, 10
  LINE r11, r2, r10, r6, r2
  LDI r11, 0x7007BE
  LDI r19, 10
  LDI r12, 0x350AB9
  LDI r14, 32
  LDI r10, 1381
  LINE r11, r19, r12, r14, r10
  LDI r11, 3028
  LDI r2, 2
  LDI r3, 0x31F04A
  LDI r10, 3908
  CIRCLE r11, r2, r3, r10
endif_1:
  LDI r12, 10
loop_2:
  AND r10, r6, r13
  LDI r14, 1
  SUB r12, r12, r14
  JNZ r12, loop_2
  PUSH r1
  PUSH r5
  PUSH r15
  PUSH r15
  SUB r4, r7, r3
  AND r21, r9, r6
  XOR r0, r3, r12
  SHR r0, r9, r12
  AND r10, r19, r1
  POP r15
  POP r15
  POP r5
  POP r1
  CALL func_3
func_3:
  AND r7, r0, r9
  AND r5, r11, r6
  ADD r9, r13, r20
  SUB r2, r0, r14
  RET
  OR r0, r1, r6
  PUSH r15
  PUSH r11
  PUSH r0
  SHL r12, r6, r0
  XOR r0, r11, r30
  POP r0
  POP r11
  POP r15
  CALL func_4
func_4:
  XOR r7, r0, r8
  OR r8, r7, r15
  MOD r0, r14, r6
  ADD r0, r9, r4
  SHR r10, r7, r6
  ADD r9, r6, r0
  RET
main_5:
  SHR r12, r1, r4
  SAR r7, r14, r9
  SHR r15, r6, r5
  SAR r1, r5, r2
  CMPI r15, 49
  ADDI r1, r14, 0x828198
  XOR r15, r1, r14
  XOR r4, r5, r1
  OR r12, r1, r21
  OR r7, r1, r4
  LDI r0, 468
  LDI r8, 0x6BB3A6
  LDI r5, 2599
  WPIXEL
  IKEY r2
  CMPI r2, 70
  JNZ r2, key_6
  FRAME
  JMP main_5
